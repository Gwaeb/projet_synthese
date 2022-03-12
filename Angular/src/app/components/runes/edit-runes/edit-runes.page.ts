import { Component, OnInit } from '@angular/core';
import { FormArray, FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Category } from 'src/app/models/category.model';
import { Rune } from 'src/app/models/rune.model';
import { RunePage } from 'src/app/models/rune_page.model';
import { RunePageService } from 'src/app/services/rune-page.service';
import { SeedsService } from 'src/app/services/seeds.service';

@Component({
  selector: 'app-edit-runes',
  templateUrl: './edit-runes.page.html',
  styleUrls: ['./edit-runes.page.scss'],
})
export class EditRunesPage implements OnInit {
  categories!: Category[];
  mainRunes!: Rune[];
  secondaryRunes!: Rune[];
  shardsRunes!: Rune[];

  editPageForm: FormGroup;

  constructor(
    private seedsService: SeedsService,
    private router: Router,
    private runePageService: RunePageService,
    private route: ActivatedRoute
  ) {
    this.route.paramMap.subscribe((e) => {
      this.runePageService.getPage(<string>e.get('id')).subscribe((build) => {
        this.seedsService.getCategories().subscribe((cats) => {
          this.seedsService.getRunesByCategory(cats[0]).subscribe((e) => {
            this.mainRunes = e;
            this.categories = cats;
            this.seedsService.getRunesByCategory(cats[1]).subscribe((e) => {
              this.secondaryRunes = e;

              var runes = build?.runes.map((rune) => {
                return rune.id;
              });
              this.changeMainCategory(
                this.categories.filter(
                  (e) => e.id == build?.runes[0].category_id
                )[0]
              );
              this.changeSecondCategory(
                this.categories.filter(
                  (e) => e.id == build?.runes[4].category_id
                )[0]
              );
              this.editPageForm.setValue({ name: build?.name, runes: runes });
            });
            this.seedsService.getRunesByCategory(cats[5]).subscribe((e) => {
              this.shardsRunes = e;
            });
          });
        });
      });
    });
    this.editPageForm = new FormGroup({
      name: new FormControl(null, [Validators.required]),
      runes: new FormArray([
        new FormControl(null, [Validators.required]),
        new FormControl(null, [Validators.required]),
        new FormControl(null, [Validators.required]),
        new FormControl(null, [Validators.required]),
        new FormControl(null, [Validators.required]),
        new FormControl(null, [Validators.required]),
        new FormControl(null, [Validators.required]),
        new FormControl(null, [Validators.required]),
        new FormControl(null, [Validators.required]),
      ]),
    });
  }

  ngOnInit(): void {}

  editPage(): void {
    this.route.paramMap.subscribe((e) => {
      this.editPageForm.value.id = Number(e.get('id'));
      this.runePageService
        .updatePage(new RunePage(this.editPageForm.value))
        .subscribe((e) => {
          if (e) this.router.navigate(['/runes']);
        });
    });
  }
  cancel(): void {
    this.router.navigate(['/runes']);
  }

  changeMainCategory(category: Category) {
    this.seedsService.getRunesByCategory(category).subscribe((e) => {
      this.mainRunes = e;
    });
  }

  changeSecondCategory(category: Category) {
    this.seedsService.getRunesByCategory(category).subscribe((e) => {
      this.secondaryRunes = e;
    });
  }

}
