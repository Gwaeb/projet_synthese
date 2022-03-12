import { Component, OnInit } from '@angular/core';
import { Subject } from 'rxjs';
import { ListSSF } from 'src/app/models/list-ssf.model';
import { Rune } from 'src/app/models/rune.model';
import { RunePage } from 'src/app/models/rune_page.model';
import { RunePageService } from 'src/app/services/rune-page.service';

@Component({
  selector: 'app-runes-list',
  templateUrl: './runes-list.component.html',
  styleUrls: ['./runes-list.component.scss'],
})
export class RunesListComponent implements OnInit {

  public static updateList: Subject<any> = new Subject();
  public static sortList: Subject<ListSSF> = new Subject();

  runesPages!: RunePage[];
  filteredRunesPages!: RunePage[];


  page!: RunePage;
  show!: boolean;


  constructor(private runeService: RunePageService) {
    RunesListComponent.sortList.subscribe((res) => {
      this.updateChampList(res);
    });
  }

  deleteResult(result: boolean) {
    if(result) this.runeService.deletePage(this.page).subscribe((e) => {
      if (e) this.ngOnInit()
      else alert("un problème est survenu");
    });
  }
  deletePage(page: RunePage) {
    this.page = page;
    this.show = true;
  }
  closeEvent() {
    this.show = false;
  }


  ngOnInit(): void {
    this.runeService.getPages().subscribe((e) => {
      this.runesPages = e;
      this.filteredRunesPages = this.runesPages;
    });

  }

  updateChampList(filter: ListSSF) {
    this.filteredRunesPages = [];
    this.runesPages.forEach(e => this.filteredRunesPages.push(e));

    if (filter.name) {
      this.filteredRunesPages = this.filteredRunesPages.filter(page => page.name.toLowerCase().includes(filter.name.toLowerCase()))
    }
    if (!isNaN(filter.filter)) {
      this.filteredRunesPages = this.filteredRunesPages.filter(page => {
        return !!page.categories.filter(cat => cat.id == filter.filter)[0];
      })
    }
    if (!isNaN(filter.sort)) {
      this.filteredRunesPages = this.filteredRunesPages.sort((a, b) => {
        if (filter.sort == 0) {
          return (a.categories[0].id > b.categories[0].id)? 1 : (a.categories[0].id < b.categories[0].id)? -1 : 0;
        } else if (filter.sort == 1) {
          return (a.name.toLowerCase() > b.name.toLowerCase())? 1 : (a.name.toLowerCase() < b.name.toLowerCase())? -1 : 0;
        }
        return 0;
      })
    }
  }

}
