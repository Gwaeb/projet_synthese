import { custom, JSONObject, optional, required } from "ts-json-object";
import { Friend } from "./friend.model";
import { Item } from "./item.model";
import { User } from "./user.model";

export class Planning extends JSONObject {
  @optional
  id!: number;

  @required
  title!: string;

  @required
  date!: string;

  @optional
  creator!: User;

  @optional
  friends!: Friend[];

}
