import { Component, Input, OnInit } from '@angular/core';
import { FormControl, FormGroup } from '@angular/forms';
import { Item } from 'src/app/models/item.model';
import { SeedsService } from 'src/app/services/seeds.service';

@Component({
  selector: 'app-add-build-item',
  templateUrl: './add-build-item.component.html',
  styleUrls: ['./add-build-item.component.scss'],
})
export class AddBuildItemComponent implements OnInit {
  @Input() itemNumber!: number;
  @Input() form!: FormGroup;
  @Input() items!: Item[];
  selectItem: Item | null = null;
  constructor(private seedsService: SeedsService) {}
  ngOnInit(): void {}
}
