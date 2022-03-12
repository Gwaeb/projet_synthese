import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { MatchHistory } from 'src/app/models/match_history.model';
import { MatchService } from 'src/app/services/match.service';
import { MatchListComponent } from '../match-list/match-list.component';

@Component({
  selector: 'app-match-list-item',
  templateUrl: './match-list-item.component.html',
  styleUrls: ['./match-list-item.component.scss'],
})
export class MatchListItemComponent implements OnInit {
  @Input() matchHistory!: MatchHistory;
  @Output() matchDelete = new EventEmitter<MatchHistory>();

  victory!: boolean;

  constructor(private router: Router, private matchService: MatchService) {}

  ngOnInit(): void {
    this.victory = this.matchHistory.victory;
  }

  editMatch(): void {
    this.router.navigate(['/matches/edit/' + this.matchHistory.id]);
  }
  deleteMatch(): void {
    this.matchDelete.emit(this.matchHistory);
  }
}
