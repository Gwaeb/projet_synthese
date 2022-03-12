import { custom, JSONObject, optional, required } from "ts-json-object";

export class Category extends JSONObject {
  @required
  id!: number;

  @required
  name!: string;

  @required
  description!: string;

  @required
  picture_path!: string;
}
