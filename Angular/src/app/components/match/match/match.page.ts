import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ListSSF } from 'src/app/models/list-ssf.model';
import { MatchListComponent } from '../match-list/match-list.component';

@Component({
  selector: 'app-match',
  templateUrl: './match.page.html',
  styleUrls: ['./match.page.scss'],
})
export class MatchPage implements OnInit {
  filterName!: string;
  filterLane!: number;
  sort!: number;

  constructor(private router: Router, private route: ActivatedRoute) {}

  ngOnInit(): void {}

  add() {
    this.router.navigate(['/matches/add']);
  }

  filterChange(data: any) {
    this.filterLane = Number(data);
    this.updateList();
  }

  sortChange(data: any) {
    this.sort = Number(data);
    this.updateList();
  }

  nameChange(data: string) {
    this.filterName = data;
    this.updateList();
  }

  updateList() {
    MatchListComponent.sortList.next(
      new ListSSF({ name: this.filterName, filter: this.filterLane, sort: this.sort})
    );
  }
}
