import {NgModule} from '@angular/core';
import {CommonModule} from '@angular/common';
import {AdminLoginComponent} from './admin-login/admin-login.component';
import {ForgotPasswordComponent} from './forgot-password/forgot-password.component';
import {ForgotUsernameComponent} from './forgot-username/forgot-username.component';
import {LoginComponent} from './login/login.component';
import {LogoutComponent} from './logout/logout.component';
import {RegisterComponent} from './register/register.component';
import {RegistrationSuccessComponent} from './registration-success/registration-success.component';
import {ResetPasswordComponent} from './reset-password/reset-password.component';
import {UnlockAccountComponent} from './unlock-account/unlock-account.component';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';
import {
  MatDialogModule,
  MatFormFieldModule,
  MatProgressBarModule,
  MatSelectModule,
  MatSnackBarModule
} from '@angular/material';
import {routing} from './authentication.routing';
import {TranslateModule} from '@ngx-translate/core';
import {NgxLocalizedNumbers} from 'ngx-localized-numbers';
import { HomeComponent } from './home/home.component';
import {ShowHidePasswordModule} from 'ngx-show-hide-password';
import {AngularSvgIconModule} from 'angular-svg-icon';

@NgModule({
    imports: [
        CommonModule,
        routing,
        FormsModule,
        MatFormFieldModule,
        MatSelectModule,
        MatSnackBarModule,
        MatProgressBarModule,
        MatDialogModule,
        TranslateModule,
        NgxLocalizedNumbers,
        ReactiveFormsModule,
        ShowHidePasswordModule,
        AngularSvgIconModule
    ],
  declarations: [
    AdminLoginComponent,
    ForgotPasswordComponent,
    ForgotUsernameComponent,
    LoginComponent,
    LogoutComponent,
    RegisterComponent,
    RegistrationSuccessComponent,
    ResetPasswordComponent,
    UnlockAccountComponent,
    HomeComponent
  ],
  exports: [],
})
export class AuthenticationModule {
}
