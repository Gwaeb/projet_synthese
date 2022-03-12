import { custom, JSONObject, optional, required } from 'ts-json-object';
export class Friend extends JSONObject {
  @optional
  id!: number;

  @required
  email!: string;

  @required
  name!: string;

  @optional
  picture_path!: string;

  @optional
  checked: boolean | null = false

  @optional
  accepted!: Date;
}
