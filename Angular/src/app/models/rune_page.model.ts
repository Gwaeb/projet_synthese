import { custom, JSONObject, optional, required } from "ts-json-object";
import { Category } from "./category.model";
import { Item } from "./item.model";
import { Rune } from "./rune.model";

export class RunePage extends JSONObject {
  @optional
  id!: number;

  @required
  name!: string;

  @required
  runes!: Rune[];

  @optional
  categories!: Category[];

  @optional
  used!: number;

}
