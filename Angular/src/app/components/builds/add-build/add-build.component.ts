import { Component, OnInit } from '@angular/core';
import { FormArray, FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Build } from 'src/app/models/build.model';
import { Item } from 'src/app/models/item.model';
import { BuildService } from 'src/app/services/build.service';
import { SeedsService } from 'src/app/services/seeds.service';

@Component({
  selector: 'app-add-build',
  templateUrl: './add-build.component.html',
  styleUrls: ['./add-build.component.scss'],
})
export class AddBuildComponent implements OnInit {
  addBuildForm: FormGroup;
  items!: Item[];
  selectValue: string = '';

  constructor(
    private seedsService: SeedsService,
    private buildService: BuildService,
    private router: Router
  ) {
    this.seedsService.getItems().subscribe((e) => {
      this.items = e;
    });
    this.addBuildForm = new FormGroup({
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
    return this.addBuildForm.get('items') as FormArray;
  }

  addBuild(): void {
    this.buildService
      .addBuild(new Build(this.addBuildForm.value))
      .subscribe((e) => {
        if (e) this.router.navigate(['/builds']);
      });
  }

  cancel() {
    this.router.navigate(['/builds']);
  }
}
