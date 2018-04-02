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
        tap(res => this.log(`fetched todos`)),
        catchError(this.handleError('getTodoes', []))
      );
  }

  // get a todo by id.
  getTodo(id: number): Observable<Todo> {
    const url = `${this.todosUrl}/${id}`;
    return this.http.get<Todo>(url).pipe(
      tap(res => this.log(`fetched todo`)),
      catchError(this.handleError<Todo>(`getTodo id=${id}`))
    );
  }

  //  add new todo.
  addTodo(todo: Todo): Observable<Todo> {
    const params = {
      todo: todo,
    };

    return this.http.post<Todo>(this.todosUrl, params, httpOptions).pipe(
      tap(res => this.log(`added todo`)),
      catchError(this.handleError<Todo>('addTodo'))
    );
  }

  // delete todo.
  deleteTodo(todo: Todo | number): Observable<Todo> {
    const id = typeof todo === 'number' ? todo : todo.id;
    const url = `${this.todosUrl}/${id}`;

    return this.http.delete<Todo>(url, httpOptions).pipe(
      tap(res => this.log(`deleted todo`)),
      catchError(this.handleError<Todo>('deleteTodo'))
    );
  }

  // update todo.
  updateTodo(todo: Todo): Observable<any> {
    const url = `${this.todosUrl}/${todo.id}`;
    return this.http.put(url, todo, httpOptions).pipe(
      tap(res => this.log(`updated todo`)),
      catchError(this.handleError<any>('updateTodo'))
    );
  }

  // star todo.
  starTodo(todo: Todo): Observable<any> {
    const url = `${this.todosUrl}/${todo.id}/star`;
    return this.http.put(url, {}, httpOptions).pipe(
      tap(res => this.log(`starred todo`)),
      catchError(this.handleError<any>('starTodo'))
    );
  }

  // unstar todo.
  unstarTodo(todo: Todo): Observable<any> {
    const url = `${this.todosUrl}/${todo.id}/unstar`;
    return this.http.put(url, {}, httpOptions).pipe(
      tap(res => this.log(`unstarred todo`)),
      catchError(this.handleError<any>('unstarTodo'))
    );
  }

  // done todo.
  doneTodo(todo: Todo): Observable<any> {
    const url = `${this.todosUrl}/${todo.id}/done`;
    return this.http.put(url, {}, httpOptions).pipe(
      tap(res => this.log(`done todo`)),
      catchError(this.handleError<any>('doneTodo'))
    );
  }

  // undone todo.
  undoneTodo(todo: Todo): Observable<any> {
    const url = `${this.todosUrl}/${todo.id}/undone`;
    return this.http.put(url, {}, httpOptions).pipe(
      tap(res => this.log(`undone todo`)),
      catchError(this.handleError<any>('undoneTodo'))
    );
  }

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
