import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';


import { AppComponent } from './app.component';
import { TodosComponent } from './todos/todos.component';
import { TodoService } from './todo.service';
import { HttpClientModule } from '@angular/common/http';


@NgModule({
  declarations: [
    AppComponent,
    TodosComponent,
  ],
  imports: [
    BrowserModule,
    NgbModule.forRoot(),
    HttpClientModule,
  ],
  providers: [
    TodoService,
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
