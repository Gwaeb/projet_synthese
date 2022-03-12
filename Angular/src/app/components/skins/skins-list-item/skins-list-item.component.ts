import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Skin } from 'src/app/models/skin.model';
import { SkinWishListService } from 'src/app/services/skin-wishlist.service';
import { DeleteComponent } from '../../modals/delete/delete.component';
import { SkinsListComponent } from '../skins-list/skins-list.component';

@Component({
  selector: 'app-skins-list-item',
  templateUrl: './skins-list-item.component.html',
  styleUrls: ['./skins-list-item.component.scss'],
})
export class SkinsListItemComponent implements OnInit {
  @Input() skin!: Skin;
  @Output() skinDelete = new EventEmitter<Skin>();

  isAdd!: boolean;
  isEdit!: boolean;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private skinwlService: SkinWishListService
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

  deleteSkin(): void {
    this.skinDelete.emit(this.skin);
  }

  editSkin(): void {
    this.router.navigate([`/skins/edit/${this.skin.id}`])
  }

  addSkin(): void {
    this.skinwlService.addSkin(this.skin).subscribe((e) => {
      if (e) this.router.navigate(['/skins']);
    });
  }

  updateSkin(): void {
    this.route.url.subscribe(e => {
      this.skinwlService.updateSkin(this.skin, e[1].path).subscribe((e) => {
        if (e) this.router.navigate(['/skins']);
      });
    })
  }
}
