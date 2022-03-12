import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { Build } from 'src/app/models/build.model';
import { BuildService } from 'src/app/services/build.service';
import { BuildsListComponent } from '../builds-list/builds-list.component';

@Component({
  selector: 'app-builds-list-item',
  templateUrl: './builds-list-item.component.html',
  styleUrls: ['./builds-list-item.component.scss'],
})
export class BuildsListItemComponent implements OnInit {
  @Input() build!: Build;

  @Output() buildDelete = new EventEmitter<Build>();

  emptyItems!: number[];

  constructor(private router: Router, private buildService: BuildService) {}

  ngOnInit(): void {
    let tempo = 6 - this.build?.items.length;
    this.emptyItems = Array(tempo).fill(1);
  }

  editBuild(): void {
    this.router.navigate(['/builds/edit/' + this.build.id]);
  }
  deleteBuild(): void {
    this.buildDelete.emit(this.build);
  }
}
