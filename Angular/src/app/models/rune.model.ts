import { custom, JSONObject, optional, required } from 'ts-json-object';

export class Rune extends JSONObject {
  @required
  id!: number;

  @required
  name!: string;

  @required
  description!: string;

  @required
  level!: number;

  @required
  category_id!: number;

  @required
  picture_path!: string;
}
