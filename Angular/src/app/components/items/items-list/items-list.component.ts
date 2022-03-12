import { Component, OnInit } from '@angular/core';
import { Item } from 'src/app/models/item.model';
import { SeedsService } from 'src/app/services/seeds.service';

@Component({
  selector: 'app-items-list',
  templateUrl: './items-list.component.html',
  styleUrls: ['./items-list.component.scss']
})
export class ItemsListComponent implements OnInit {


  items!: Item[]

  constructor(private seedsService: SeedsService) {
    seedsService.getItems().subscribe(e => {
      this.items = e;
    })
  }

  ngOnInit(): void {
  }

}
