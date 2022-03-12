import { custom, JSONObject, optional, required } from 'ts-json-object';

export class RapportRune extends JSONObject {

  @required
  runes_page_name!: string;

  @required
  nb_time_used!: number

  @required
  victories!: number;

  @required
  defeats!: number;

  @required
  @custom((data: any, key:string, value: string) => { return Number(value).toFixed(1)})
  pourcentage_victories!: number

}
