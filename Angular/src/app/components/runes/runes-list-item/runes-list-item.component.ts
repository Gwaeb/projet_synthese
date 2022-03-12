import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { RunePage } from 'src/app/models/rune_page.model';
import { RunePageService } from 'src/app/services/rune-page.service';
import { RunesListComponent } from '../runes-list/runes-list.component';

@Component({
  selector: 'app-runes-list-item',
  templateUrl: './runes-list-item.component.html',
  styleUrls: ['./runes-list-item.component.scss'],
})
export class RunesListItemComponent implements OnInit {
  @Input() runePage!: RunePage;

  @Output() pageDelete = new EventEmitter<RunePage>();

  constructor(private router: Router, private runePageService: RunePageService) {}

  ngOnInit(): void {}

  editRunePage(): void {
    this.router.navigate(['/runes/edit/' + this.runePage.id]);
  }
  deleteRunePage(): void {
    this.pageDelete.emit(this.runePage);
  }
}
