import "dotenv/config";
import { Resend } from 'resend';

let resend;

const getResendClient = () => {
  if (!process.env.RESEND_API_KEY) {
    throw new Error("RESEND_API_KEY is not defined in environment variables");
  }

  resend ??= new Resend(process.env.RESEND_API_KEY);
  return resend;
}

export const sendVerificationEmail = async (toEmail, verificationLink) => {
  await getResendClient().emails.send({
    from: 'IsdaOK <noreply@isdaok.app>',
    to: toEmail,
    subject: 'Verify Your Email (no reply)',
    html: `
      <h2>Welcome to IsdaOK!</h2>
      <p>Click the link below to verify your email:</p>
      <a href="${verificationLink}">Verify Email</a>
      <p>This link expires in 5 minutes.</p>
    `,
  });
};

export const sendResetEmail = async (toEmail, resetLink) => {
  await getResendClient().emails.send({
    from: 'IsdaOK <noreply@isdaok.app>',
    to: toEmail,
    subject: 'Reset Your Password (no reply)',
    html: `
      <h2>Password Reset</h2>
      <p>Click the link below to reset your password:</p>
      <a href="${resetLink}">Reset Password</a>
      <p>This link expires in 10 minutes.</p>
      <p>If you didn't request this, ignore this email.</p>
    `,
  });
};