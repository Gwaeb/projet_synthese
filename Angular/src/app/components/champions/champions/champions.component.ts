import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, NgForm } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { ListSSF } from 'src/app/models/list-ssf.model';
import { ChampionsListComponent } from '../champions-list/champions-list.component';

@Component({
  selector: 'app-champions',
  templateUrl: './champions.component.html',
  styleUrls: ['./champions.component.scss'],
})
export class ChampionsComponent implements OnInit {
  filterPrice!: number;
  filterName!: string;
  filterLane!: number;
  sort!: number;

  constructor(private router: Router, private route: ActivatedRoute) {}

  ngOnInit(): void {}

  add() {
    this.router.navigate(['/champions/add']);
  }

  priceChange(data: string) {
    this.filterPrice = Number(data);
    this.updateList();
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
    ChampionsListComponent.sortList.next(
      new ListSSF({
        price: this.filterPrice,
        name: this.filterName,
        filter: this.filterLane,
        sort: this.sort,
      })
    );
  }
}
