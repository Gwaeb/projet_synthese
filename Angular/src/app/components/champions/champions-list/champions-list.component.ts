import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Subject } from 'rxjs';
import { ChampionWishList } from 'src/app/models/champion-wishlist.model';
import { Champion } from 'src/app/models/champion.model';
import { ListSSF } from 'src/app/models/list-ssf.model';
import { ChampionWishListService } from 'src/app/services/champion-wishlist.service';
import { SeedsService } from 'src/app/services/seeds.service';

@Component({
  selector: 'app-champions-list',
  templateUrl: './champions-list.component.html',
  styleUrls: ['./champions-list.component.scss'],
})
export class ChampionsListComponent implements OnInit {
  public static updateList: Subject<any> = new Subject();
  public static sortList: Subject<ListSSF> = new Subject();

  champions!: Champion[];
  filteredChampions!: Champion[];
  title!: string;

  champion!: Champion;
  show!: boolean;

  constructor(
    private championwlService: ChampionWishListService,
    private seedService: SeedsService,
    private route: ActivatedRoute
  ) {
    ChampionsListComponent.sortList.subscribe((res) => {
      this.updateChampList(res);
    });
  }

  deleteResult(result: boolean) {
    if (result)
      this.championwlService.deleteChampion(this.champion).subscribe((e) => {
        if (e) this.ngOnInit();
        else alert('Un problème est survenu');
      });
  }
  deleteChampion(champion: Champion) {
    this.champion = champion;
    this.show = true;
  }
  closeEvent() {
    this.show = false;
  }

  ngOnInit(): void {
    this.route.url.subscribe((e) => {
      if (e.length != 0) {
        this.seedService.getChampions().subscribe((champ) => {
          this.championwlService.getChampions().subscribe((champWl) => {
            this.champions = champ.filter((ch) => {
              return champWl.map((e) => e.champion.id).indexOf(ch.id) == -1;
            });
            this.filteredChampions = this.champions;
            if (e[0].path.toLowerCase() == 'add') this.title = 'Ajout';
            else if (e[0].path.toLowerCase() == 'edit')
              this.title = 'Remplacement';
          });
        });
      } else {
        this.championwlService.getChampions().subscribe((e) => {
          this.champions = e.map((e) => e.champion);
          this.filteredChampions = this.champions;
          this.title = 'Liste';
        });
      }
    });
  }

  updateChampList(filter: ListSSF) {
    this.filteredChampions = [];
    this.champions.forEach((e) => this.filteredChampions.push(e));

    if (filter.name) {
      this.filteredChampions = this.filteredChampions.filter((champion) =>
        champion.name.toLowerCase().includes(filter.name.toLowerCase())
      );
    }
    if (filter.price) {
      this.filteredChampions = this.filteredChampions.filter(
        (champion) => champion.price <= filter.price
      );
    }
    if (!isNaN(filter.filter)) {
      this.filteredChampions = this.filteredChampions.filter(
        (champion) => champion.position == filter.filter
      );
    }
    if (!isNaN(filter.sort)) {
      this.filteredChampions = this.filteredChampions.sort((a, b) => {
        if (filter.sort == 0) {
          return a.position > b.position ? 1 : a.position < b.position ? -1 : 0;
        } else if (filter.sort == 1) {
          return a.price > b.price ? 1 : a.price < b.price ? -1 : 0;
        }
        return 0;
      });
    }
  }
}
