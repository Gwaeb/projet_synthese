import { Component, OnInit } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { Build } from 'src/app/models/build.model';
import { Champion } from 'src/app/models/champion.model';
import { MatchHistory } from 'src/app/models/match_history.model';
import { Rune } from 'src/app/models/rune.model';
import { RunePage } from 'src/app/models/rune_page.model';
import { BuildService } from 'src/app/services/build.service';
import { MatchService } from 'src/app/services/match.service';
import { RunePageService } from 'src/app/services/rune-page.service';
import { SeedsService } from 'src/app/services/seeds.service';

@Component({
  selector: 'app-edit-match',
  templateUrl: './edit-match.page.html',
  styleUrls: ['./edit-match.page.scss']
})
export class EditMatchPage implements OnInit {

  allChamps: Champion[] = [];
  allBuilds: Build[] = [];
  allRunes: RunePage[] = [];
  emptyItems: number[] = [];

  selectedChampion!: Champion;
  selectedBuild!: Build;
  selectedRunesPage!: RunePage;

  editMatchForm: FormGroup;

  victory: boolean = true;
  match!: MatchHistory | null;

  id!: string

  constructor(
    private seedService: SeedsService,
    private buildService: BuildService,
    private runePageService: RunePageService,
    private matchService: MatchService,
    private router: Router,
    private route: ActivatedRoute
  ) {
    this.editMatchForm = new FormGroup({
      champion: new FormControl(null, [Validators.required]),
      build: new FormControl(null, [Validators.required]),
      rune_page: new FormControl(null, [Validators.required]),
      position: new FormControl(null, [Validators.required]),
      last_item: new FormControl(0),
    });
    this.route.paramMap.subscribe(e => {
      this.id = <string>e.get("id");
    })


    this.seedService.getChampions().subscribe((champs) => {
      this.allChamps = champs;
      this.buildService.getBuilds().subscribe((builds) => {
        this.allBuilds = builds;
        this.runePageService.getPages().subscribe((runes) => {
          this.allRunes = runes;
            this.matchService.getMatch(this.id).subscribe(match => {
              this.match = match;
              let champion = <Champion>match?.champion;
              champion = this.allChamps.filter(champ => {
                return champ.id == champion.id;
              })[0];

              let build = <Build>match?.build;
              build = this.allBuilds.filter(bui => {
                return bui.id == build.id;
              })[0];
              let rune_page = <RunePage>match?.rune_page;
              rune_page = this.allRunes.filter(rune => {
                return rune.id == rune_page.id;
              })[0];
              this.victory = !!match?.victory;
              this.editMatchForm.setValue({champion: champion, build: build, rune_page: rune_page, position: match?.position, last_item: match?.last_item});
              this.updateEmpty();
            })
          })
      });
    });


  }

  ngOnInit(): void {}


  resetItem() {
    this.editMatchForm.patchValue({last_item: 0});
  }
  updateEmpty() {
    let tempo = 6 - this.selectedBuild.items.length;
    this.emptyItems = Array(tempo).fill(1);
  }

  editMatch() {

    this.editMatchForm.value.victory = this.victory;
    this.editMatchForm.value.id = Number(this.id);
    this.matchService
      .updateMatch(new MatchHistory(this.editMatchForm.value))
      .subscribe((e) => {
        if (!!e?.success) this.router.navigate(['/matches']);
      });
  }

  result(): void {
    this.victory = !this.victory;
  }
  cancel(): void {
    this.router.navigate(['/matches']);
  }
}
