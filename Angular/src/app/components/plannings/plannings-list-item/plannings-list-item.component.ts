import { formatDate } from '@angular/common';
import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { Planning } from 'src/app/models/planning.model';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-plannings-list-item',
  templateUrl: './plannings-list-item.component.html',
  styleUrls: ['./plannings-list-item.component.scss'],
})
export class PlanningsListItemComponent implements OnInit {
  @Input() planning!: Planning;
  @Output() planningDelete = new EventEmitter<Planning>();

  formattedDate!: string | null;
  canEdit: Boolean = false;
  now: Date = new Date();
  date!: Date;

  constructor(private authService: AuthService, private router: Router) {}

  ngOnInit(): void {
    this.date = new Date(this.planning.date.replace("Z", "-05:00"))
    this.formattedDate = formatDate(
      this.planning.date,
      'dd-MM-yyyy hh:mm a',
      'en_US',
      'UTC'
    );

    if (this.authService.currentUser?.id == this.planning.creator.id) {
      this.canEdit = true;
    }
  }

  editPlanning(): void {
    this.router.navigate(['/plannings/edit/' + this.planning.id]);
  }

  deletePlanning(): void {
    this.planningDelete.emit(this.planning);
  }

  denyPlanning(): void {
    this.planningDelete.emit(this.planning);
  }
}
