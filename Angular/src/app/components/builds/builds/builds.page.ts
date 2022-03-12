import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ListSSF } from 'src/app/models/list-ssf.model';
import { BuildsListComponent } from '../builds-list/builds-list.component';

@Component({
  selector: 'app-builds',
  templateUrl: './builds.page.html',
  styleUrls: ['./builds.page.scss'],
})
export class BuildsPage implements OnInit {

  filterName!: string;
  filterLane!: number;
  sort!: number;

  constructor(private router: Router) {}

  ngOnInit(): void {}

  add() {
    this.router.navigate(['/builds/add']);
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
    BuildsListComponent.sortList.next(new ListSSF({name: this.filterName, filter: this.filterLane, sort: this.sort}));
  }

}
