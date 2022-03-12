import { custom, JSONObject, optional, required } from "ts-json-object";
import { Item } from "./item.model";

export class ListSSF extends JSONObject {

  @optional
  @custom((list: ListSSF, key:string, value: string) => {
    return value.toLowerCase();
  })
  name!: string;

  @optional
  price!: number;

  @optional
  filter!: number;

  @optional
  sort!: number;


}
