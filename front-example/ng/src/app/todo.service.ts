import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { Observable } from 'rxjs/Observable';
import { of } from 'rxjs/observable/of';
import { catchError, map, tap } from 'rxjs/operators';

import { Todo } from './todo';

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable()
export class TodoService {

  private todosUrl = 'http://localhost:3000/todos';

  constructor(
    private http: HttpClient,
  ) { }

  // get todos.
  getTodoes(): Observable<Todo[]> {
    return this.http.get<Todo[]>(this.todosUrl)
      .pipe(
        tap(todos => this.log(`fetched todos`)),
        catchError(this.handleError('getTodoes', []))
      );
  }

  // get a todo by id.
  getTodo(id: number): Observable<Todo> {
    const url = `${this.todosUrl}/${id}`;
    return this.http.get<Todo>(url).pipe(
      tap(todos => this.log(`fetched todos`)),
      catchError(this.handleError<Todo>(`getTodo id=${id}`))
    );
  }

  //  add new todo.
  addTodo(todo: Todo): Observable<Todo> {
    return this.http.post<Todo>(this.todosUrl, todo, httpOptions).pipe(
      tap(todos => this.log(`fetched todos`)),
      catchError(this.handleError<Todo>('addTodo'))
    );
  }

  // delete todo.
  deleteTodo(todo: Todo | number): Observable<Todo> {
    const id = typeof todo === 'number' ? todo : todo.id;
    const url = `${this.todosUrl}/${id}`;

    return this.http.delete<Todo>(url, httpOptions).pipe(
      tap(todos => this.log(`fetched todos`)),
      catchError(this.handleError<Todo>('deleteTodo'))
    );
  }

  // update todo.
  updateTodo(todo: Todo): Observable<any> {
    return this.http.put(this.todosUrl, todo, httpOptions).pipe(
      tap(todos => this.log(`fetched todos`)),
      catchError(this.handleError<any>('updateTodo'))
    );
  }

  // star / unstar
  // done / undone

  /**
   * common error handler.
   * @param operation - failed operation name.
   * @param result - return value.
   */
  private handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {

      // TODO: better error handle.
      alert(`${operation} failed: ${error.message}`);
      return of(result as T);
    };
  }

  // write log.
  private log(message: string) {
    console.log('TodoService: ' + message);
  }
}
