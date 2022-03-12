import { custom, JSONObject, optional, required } from "ts-json-object";

export class Item extends JSONObject {
  @required
  id!: number;

  @required
  name!: string;

  @required
  description!: string;

  @required
  price!: number;

  @required
  picture_path!: string;
}
