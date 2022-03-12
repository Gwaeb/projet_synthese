import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { ListSSF } from 'src/app/models/list-ssf.model';
import { RunesListComponent } from '../runes-list/runes-list.component';

@Component({
  selector: 'app-runes',
  templateUrl: './runes.page.html',
  styleUrls: ['./runes.page.scss'],
})
export class RunesPage implements OnInit {

  filterName!: string;
  filterCategory!: number;
  sort!: number;

  constructor(private router: Router) {}

  ngOnInit(): void {}

  add() {
    this.router.navigate(['/runes/add']);
  }

  filterChange(data: any) {
    this.filterCategory = Number(data);
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
    RunesListComponent.sortList.next(new ListSSF({name: this.filterName, filter: this.filterCategory, sort: this.sort}));
  }

}
