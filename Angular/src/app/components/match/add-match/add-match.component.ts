import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { Router } from '@angular/router';
import { Build } from 'src/app/models/build.model';
import { Champion } from 'src/app/models/champion.model';
import { MatchHistory } from 'src/app/models/match_history.model';
import { Rune } from 'src/app/models/rune.model';
import { RunePage } from 'src/app/models/rune_page.model';
import { BuildService } from 'src/app/services/build.service';
import { MatchService } from 'src/app/services/match.service';
import { RunePageService } from 'src/app/services/rune-page.service';
import { SeedsService } from 'src/app/services/seeds.service';
import { MatchListComponent } from '../match-list/match-list.component';

@Component({
  selector: 'app-add-match',
  templateUrl: './add-match.component.html',
  styleUrls: ['./add-match.component.scss'],
})
export class AddMatchComponent implements OnInit {
  allChamps: Champion[] = [];
  allBuilds: Build[] = [];
  allRunes: RunePage[] = [];
  emptyItems: number[] = [];

  selectedChampion!: Champion;
  selectedBuild!: Build;
  selectedRunesPage!: RunePage;

  addMatchForm: FormGroup;
  oldItem: number = 0;

  victory: boolean = true;

  constructor(
    private seedService: SeedsService,
    private buildService: BuildService,
    private runePageService: RunePageService,
    private matchService: MatchService,
    private router: Router
  ) {
    this.addMatchForm = new FormGroup({
      champion: new FormControl(null, [Validators.required]),
      build: new FormControl(null, [Validators.required]),
      rune_page: new FormControl(null, [Validators.required]),
      position: new FormControl(null, [Validators.required]),
      last_item: new FormControl(0),
    });

    this.seedService.getChampions().subscribe((champs) => {
      this.allChamps = champs;
    });
    this.buildService.getBuilds().subscribe((builds) => {
      this.allBuilds = builds;
    });
    this.runePageService.getPages().subscribe((runes) => {
      this.allRunes = runes;
    });
  }

  ngOnInit(): void {}

  updateEmpty() {
    let tempo = 6 - this.selectedBuild.items.length;
    this.emptyItems = Array(tempo).fill(1);
  }

  addMatch() {
    this.addMatchForm.value.victory = this.victory;
    this.matchService
      .addMatch(new MatchHistory(this.addMatchForm.value))
      .subscribe((e) => {
        if (!!e?.success) this.router.navigate(['/matches']);
      });
  }

  resetItem() {
    this.addMatchForm.patchValue({last_item: 0});
  }

  result(): void {
    this.victory = !this.victory;
  }
  cancel(): void {
    this.router.navigate(['/matches']);
  }
}
