import { Component, OnInit } from '@angular/core';
import { FormArray, FormControl, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Category } from 'src/app/models/category.model';
import { Rune } from 'src/app/models/rune.model';
import { RunePage } from 'src/app/models/rune_page.model';
import { RunePageService } from 'src/app/services/rune-page.service';
import { SeedsService } from 'src/app/services/seeds.service';

@Component({
  selector: 'app-add-runes',
  templateUrl: './add-runes.page.html',
  styleUrls: ['./add-runes.page.scss'],
})
export class AddRunesPage implements OnInit {
  categories!: Category[];
  mainRunes!: Rune[];
  secondaryRunes!: Rune[];
  shardsRunes!: Rune[];

  addPageForm: FormGroup;

  constructor(
    private seedsService: SeedsService,
    private router: Router,
    private runePageService: RunePageService
  ) {
    this.addPageForm = new FormGroup({
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

  ngOnInit(): void {
    this.seedsService.getCategories().subscribe((cats) => {
      this.seedsService.getRunesByCategory(cats[0]).subscribe((e) => {
        //precision
        this.mainRunes = e;
        this.categories = cats;
      });
      this.seedsService.getRunesByCategory(cats[1]).subscribe((e) => {
        //domination
        this.secondaryRunes = e;
        //console.log(this.secondaryRunes);
      });

      this.seedsService.getRunesByCategory(cats[5]).subscribe((e) => {
        this.shardsRunes = e;
        //console.log(this.shardsRunes);
      });
    });
  }

  // getRound(val: number): number {
  //   return Math.round(val);
  // }

  addPage(): void {
    this.runePageService
      .addPage(new RunePage(this.addPageForm.value))
      .subscribe((e) => {
        if (e) this.router.navigate(['/runes']);
      });
  }
  cancel(): void {
    this.router.navigate(['/runes']);
  }

  changeMainCategory(category: Category) {
    this.seedsService.getRunesByCategory(category).subscribe((e) => {
      //precision
      this.mainRunes = e;
      if (category.id == this.secondaryRunes[0].category_id) {
        this.changeSecondCategory(
          this.categories.filter((e) => e.id != category.id)[0]
        );
      }
      //console.log(this.mainRunes);
    });
  }

  changeSecondCategory(category: Category) {
    this.seedsService.getRunesByCategory(category).subscribe((e) => {
      //precision
      this.secondaryRunes = e;
      //console.log(this.mainRunes);
    });
  }
}
