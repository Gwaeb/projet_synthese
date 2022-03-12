import { custom, JSONObject, optional, required } from "ts-json-object";

export class User extends JSONObject {
  @required
  @custom((user: User, key:string, value: string) => {
    return value.toLowerCase();
  })
  email!: string;

  @optional
  name!: string;

  @optional
  picture_path!: string;

  @optional
  id!: number;
}
