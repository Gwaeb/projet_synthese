import { Component, Input, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { Rune } from 'src/app/models/rune.model';

@Component({
  selector: 'app-img-runes',
  templateUrl: './img-runes.component.html',
  styleUrls: ['./img-runes.component.scss']
})
export class ImgRunesComponent implements OnInit {

  @Input() rune!: Rune;
  @Input() runeNumber!: number;
  @Input() form!: FormGroup;

  constructor() { }

  ngOnInit(): void {
  }

}
