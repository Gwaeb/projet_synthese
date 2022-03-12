import { custom, JSONObject, optional, required } from 'ts-json-object';
import { Build } from './build.model';
import { Champion } from './champion.model';
import { Rune } from './rune.model';
import { RunePage } from './rune_page.model';

export class MatchHistory extends JSONObject {
  @optional
  id!: number;

  @required
  @custom((match: MatchHistory, key:string, value: string) => {
    return Number(value);
  })
  position!: number;

  @required
  victory!: boolean;

  @required
  rune_page!: RunePage;

  @required
  build!: Build;

  @required
  champion!: Champion;

  @required
  last_item!: number;

  @optional
  time_ago!: string;
}
