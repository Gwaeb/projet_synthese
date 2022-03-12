import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { ListSSF } from 'src/app/models/list-ssf.model';
import { SkinsListComponent } from '../skins-list/skins-list.component';

@Component({
  selector: 'app-skins',
  templateUrl: './skins.component.html',
  styleUrls: ['./skins.component.scss'],
})
export class SkinsComponent implements OnInit {

  filterPrice!: number;
  filterName!: string;
  filterLane!: number;
  sort!: number;

  constructor(private router: Router, private route: ActivatedRoute) {}

  ngOnInit(): void {}

  add() {
    this.router.navigate(['/skins/add']);
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
    SkinsListComponent.sortList.next(new ListSSF({price: this.filterPrice, name: this.filterName, filter: this.filterLane, sort: this.sort}));
  }

}
