import { Controller, Post, UseGuards } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { v4 } from 'uuid';
import { JwtGuard } from 'src/common/guards/jwt-guard.guard';

@Controller('auth')
export class AuthController {
  constructor(private readonly jwtService: JwtService) {}

  @Post('login')
  async login() {
    const user = { version: 1, email: 'email@gmail.com' };
    const token = this.jwtService.signAsync(
      { version: user.version },
      { subject: user.email, jwtid: v4() },
    );

    return { token: await token };
  }

  @UseGuards(JwtGuard)
  @Post('me')
  async me() {
    return { success: true };
  }
}
