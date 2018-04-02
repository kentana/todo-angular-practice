export class Todo {
  id?: number;
  name?: string;
  memo?: string;
  star?: boolean;
  done?: boolean;

  constructor() {
    this.name = '';
    this.star = false;
    this.done = false;
  }
}
