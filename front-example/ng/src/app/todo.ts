import { NgbDateStruct } from '@ng-bootstrap/ng-bootstrap';

export class Todo {
  id?: number;
  name?: string;
  memo?: string;
  star?: boolean;
  done?: boolean;
  due_date?: string;

  // for date picker.
  dueDateObj?: NgbDateStruct;

  constructor() {
    this.name = '';
    this.star = false;
    this.done = false;
  }
}
