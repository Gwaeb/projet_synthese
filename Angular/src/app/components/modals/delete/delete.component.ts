import { Component, ElementRef, Input, OnInit, Output, EventEmitter } from '@angular/core';

@Component({
  selector: 'app-delete',
  templateUrl: './delete.component.html',
  styleUrls: ['./delete.component.scss']
})
export class DeleteComponent implements OnInit {

  constructor() { }
  @Input() show!: boolean;
  @Input() message!: string | null;
  @Input() button!: string | null;
  @Input() name!: string | null
  @Input() disabled!: boolean;
  @Output() deleteEvent = new EventEmitter<boolean>();
  @Output() closeEvent = new EventEmitter<boolean>();

  ngOnInit(): void {
  }
  deleteElement() {
    this.deleteEvent.emit(true);
    this.close();
  }

  close(): void {
    this.closeEvent.emit(true);
  }

}
