import { ThisReceiver } from '@angular/compiler';
import { localizedString } from '@angular/compiler/src/output/output_ast';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators, FormArray } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Build } from 'src/app/models/build.model';
import { Item } from 'src/app/models/item.model';
import { Rune } from 'src/app/models/rune.model';
import { BuildService } from 'src/app/services/build.service';
import { SeedsService } from 'src/app/services/seeds.service';

@Component({
  selector: 'app-edit-build',
  templateUrl: './edit-build.component.html',
  styleUrls: ['./edit-build.component.scss']
})
export class EditBuildComponent implements OnInit {

  editBuildForm!: FormGroup;
  items!: Item[];
  selectValue: string = '';

  constructor(
    private seedsService: SeedsService,
    private buildService: BuildService,
    private router: Router,
    private route: ActivatedRoute
  ) {
    this.seedsService.getItems().subscribe((e) => {
      this.items = e;
      this.route.paramMap.subscribe(e => {
        this.buildService.getBuild(<string>e.get("id")).subscribe(build => {
          var items = <Item[]>build?.items;
          items = items.map(item => {
            return this.items.filter(e => e.id == item.id)[0];
          })
          items = items.concat(Array(6 - items.length).fill(null))
          this.editBuildForm.setValue({name: build?.name, category: build?.category, items: items});
        })
      })
    });
    this.editBuildForm = new FormGroup({
      name: new FormControl(null, [Validators.required]),
      category: new FormControl(null, [Validators.required]),
      items: new FormArray([
        new FormControl(null),
        new FormControl(null),
        new FormControl(null),
        new FormControl(null),
        new FormControl(null),
        new FormControl(null),
      ]),
    });



  }

  ngOnInit(): void {}
  get itemsF(): FormArray {
    return this.editBuildForm.get('items') as FormArray;
  }


  editBuild(): void {
    this.route.paramMap.subscribe(e => {
      this.editBuildForm.value.id = Number(e.get("id"));
      this.buildService.updateBuild(new Build(this.editBuildForm.value)).subscribe(e => {
        console.log('Succ?', e);
        if (e) this.router.navigate(['/builds']);
      })
    })
  }

  cancel() {
    this.router.navigate(['/builds']);
  }

}
