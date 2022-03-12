import { Component, OnInit } from '@angular/core';
import { Subject } from 'rxjs';
import { ListSSF } from 'src/app/models/list-ssf.model';
import { MatchHistory } from 'src/app/models/match_history.model';
import { MatchService } from 'src/app/services/match.service';

@Component({
  selector: 'app-match-list',
  templateUrl: './match-list.component.html',
  styleUrls: ['./match-list.component.scss'],
})
export class MatchListComponent implements OnInit {
  public static updateList: Subject<any> = new Subject();
  public static sortList: Subject<ListSSF> = new Subject();

  matchesHistory!: MatchHistory[];
  filteredMatchHistory!: MatchHistory[];

  match!: MatchHistory;
  show!: boolean;

  constructor(private matchService: MatchService) {
    MatchListComponent.sortList.subscribe((res) => {
      this.updateMatchesList(res);
    });
  }

  deleteResult(result: boolean) {
    if(result) this.matchService.deleteMatch(this.match).subscribe((e) => {
      if (e) this.ngOnInit()
      else alert("un problème est survenu");
    });
  }
  deleteMatch(match: MatchHistory) {
    this.match = match;
    this.show = true;
  }
  closeEvent() {
    this.show = false;
  }

  ngOnInit(): void {
    this.matchService.getMatches().subscribe((e) => {
      this.matchesHistory = e;
      this.filteredMatchHistory = this.matchesHistory;
    });
  }

  updateMatchesList(filter: ListSSF) {
    this.filteredMatchHistory = [];
    this.matchesHistory.forEach((e) => this.filteredMatchHistory.push(e));

    if (filter.name) {
      this.filteredMatchHistory = this.filteredMatchHistory.filter((match) =>
        match.champion.name.toLowerCase().includes(filter.name.toLowerCase())
      );
    }
    if (!isNaN(filter.filter)) {
      this.filteredMatchHistory = this.filteredMatchHistory.filter(
        (match) => match.position == filter.filter
      );
    }
    if (!isNaN(filter.sort)) {
      this.filteredMatchHistory = this.filteredMatchHistory.sort((a, b) => {
        if (filter.sort == 0) {
          return a.champion.name.toLowerCase() > b.champion.name.toLowerCase() ? 1 : a.champion.name.toLowerCase() < b.champion.name.toLowerCase()? -1 : 0;
        }

        if (filter.sort == 1) {
          return a.victory < b.victory ? 1 : a.victory > b.victory? -1 : 0;
        }
        return 0;
      });
    }
  }
}
