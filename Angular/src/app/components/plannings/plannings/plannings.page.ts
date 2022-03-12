import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ListSSF } from 'src/app/models/list-ssf.model';
import { PlanningsListComponent } from '../plannings-list/plannings-list.component';

@Component({
  selector: 'app-plannings',
  templateUrl: './plannings.page.html',
  styleUrls: ['./plannings.page.scss'],
})
export class PlanningsPage implements OnInit {
  filterPrice!: number;
  filterName!: string;
  filterLane!: number;
  sort!: number;

  constructor(private router: Router) {}

  ngOnInit(): void {}

  add(): void {
    this.router.navigate(['/plannings/add']);
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
    PlanningsListComponent.sortList.next(
      new ListSSF({
        name: this.filterName,
        filter: this.filterLane,
        sort: this.sort,
      })
    );
  }
}
