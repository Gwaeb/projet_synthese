import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Observable, Subject } from 'rxjs';
import { SkinWishList } from 'src/app/models/skin-wishlist.model';
import { Skin } from 'src/app/models/skin.model';
import { SkinWishListService } from 'src/app/services/skin-wishlist.service';
import { SeedsService } from 'src/app/services/seeds.service';
import { ListSSF } from 'src/app/models/list-ssf.model';

@Component({
  selector: 'app-skins-list',
  templateUrl: './skins-list.component.html',
  styleUrls: ['./skins-list.component.scss'],
})
export class SkinsListComponent implements OnInit {
  public static updateList: Subject<any> = new Subject();
  public static sortList: Subject<ListSSF> = new Subject();

  skins!: Skin[];
  filteredSkins!: Skin[];
  title!: string;

  skin!: Skin;
  show!: boolean;

  constructor(
    private skinwlService: SkinWishListService,
    private seedsService: SeedsService,
    private route: ActivatedRoute
  ) {
    SkinsListComponent.sortList.subscribe((res) => {
      this.updateSkinList(res);
    });
  }

  deleteResult(result: boolean) {
    if (result)
      this.skinwlService.deleteSkin(this.skin).subscribe((e) => {
        if (e) this.ngOnInit();
        else alert('un problème est survenu');
      });
  }
  deleteSkin(skin: Skin) {
    this.skin = skin;
    this.show = true;
  }
  closeEvent() {
    this.show = false;
  }

  ngOnInit(): void {
    this.route.url.subscribe((e) => {
      if (e.length != 0) {
        this.seedsService.getSkins().subscribe((champ) => {
          this.skinwlService.getSkins().subscribe((champWl) => {
            this.skins = champ.filter((ch) => {
              return champWl.map((e) => e.skin.id).indexOf(ch.id) == -1;
            });
            this.filteredSkins = this.skins;
            if (e[0].path.toLowerCase() == 'add') this.title = 'Ajout';
            else if (e[0].path.toLowerCase() == 'edit')
              this.title = 'Remplacement';
          });
        });
      } else {
        this.skinwlService.getSkins().subscribe((e) => {
          this.skins = e.map((e) => e.skin);
          this.filteredSkins = this.skins;
          this.title = 'Liste';
        });
      }
    });
  }

  updateSkinList(filter: ListSSF) {
    this.filteredSkins = [];
    this.skins.forEach((e) => this.filteredSkins.push(e));

    if (filter.name) {
      this.filteredSkins = this.filteredSkins.filter(
        (skin) =>
          skin.name.toLowerCase().includes(filter.name.toLowerCase()) ||
          skin.champion.name.toLowerCase().includes(filter.name.toLowerCase())
      );
    }
    if (filter.price) {
      this.filteredSkins = this.filteredSkins.filter(
        (skin) => skin.price <= filter.price
      );
    }
    if (!isNaN(filter.filter)) {
      this.filteredSkins = this.filteredSkins.filter(
        (skin) => skin.champion.position == filter.filter
      );
    }
    if (!isNaN(filter.sort)) {
      this.filteredSkins = this.filteredSkins.sort((a, b) => {
        if (filter.sort == 0) {
          return a.champion.id > b.champion.id
            ? 1
            : a.champion.id < b.champion.id
            ? -1
            : 0;
        } else if (filter.sort == 1) {
          return a.champion.position > b.champion.position
            ? 1
            : a.champion.position < b.champion.position
            ? -1
            : 0;
        } else if (filter.sort == 2) {
          return a.price > b.price ? 1 : a.price < b.price ? -1 : 0;
        }
        return 0;
      });
    }
  }
}
