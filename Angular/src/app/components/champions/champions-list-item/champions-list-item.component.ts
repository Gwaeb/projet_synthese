import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Champion } from 'src/app/models/champion.model';
import { ChampionWishListService } from 'src/app/services/champion-wishlist.service';
import { ChampionsListComponent } from '../champions-list/champions-list.component';

@Component({
  selector: 'app-champions-list-item',
  templateUrl: './champions-list-item.component.html',
  styleUrls: ['./champions-list-item.component.scss'],
})
export class ChampionsListItemComponent implements OnInit {
  @Input() champion!: Champion;
  @Output() championDelete = new EventEmitter<Champion>();

  isAdd!: boolean;
  isEdit!: boolean;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private championwlService: ChampionWishListService
  ) {
    this.route.url.subscribe((e) => {
      if (e.length == 0) return;
      if (e[0].path.toLowerCase() == "add") {
        this.isAdd = true;
      } else if (e[0].path.toLowerCase() == "edit") {
        this.isEdit = true;
      }
    });
  }

  ngOnInit(): void {}

  deleteChamp(): void {
    this.championDelete.emit(this.champion);
  }

  editChamp(): void {
    this.router.navigate([`/champions/edit/${this.champion.id}`])
  }

  addChamp(): void {
    this.championwlService.addChampion(this.champion).subscribe((e) => {
      if (e) this.router.navigate(['/champions']);
    });
  }

  updateChamp(): void {
    this.route.url.subscribe(e => {
      this.championwlService.updateChampion(this.champion, e[1].path).subscribe((e) => {
        if (e) this.router.navigate(['/champions']);
      });
    })
  }
}
