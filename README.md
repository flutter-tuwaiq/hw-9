# Assessment: Creating API with Shelf and Supabase

## Task

Create an API using the Shelf framework and Supabase to handle account creation, verification, password reset, and email change functionalities.

## Requirements

### Handling Account Creation

<!-- Implement the `POST /create_account` endpoint to create a new user account in Supabase. -->
<!-- - Validate the request body to ensure all required fields are provided (e.g., email, password). -->
<!-- - Store the user's account information (e.g., email, password) in Supabase. -->
<!-- - Return an appropriate response indicating the success or failure of the account creation process. -->

### Handling Account Verification

<!-- Implement the `POST /verify_account` endpoint to verify a user's account in Supabase. -->
<!-- - Validate the request body to ensure all required fields are provided (e.g., email, verificationCode). -->
<!-- - Verify the provided verification code against the stored code in Supabase. -->
<!-- - Update the account's verification status in the database upon successful verification. -->
<!-- - Return an appropriate response indicating the success or failure of the verification process. -->

### Handling Password Reset

<!-- Implement the `POST /reset_password` endpoint to allow users to reset their account password in Supabase. -->
<!-- - Validate the request body to ensure all required fields are provided (e.g., email, newPassword). -->
- Verify the provided email against the registered email in Supabase.
<!-- - Return an appropriate response indicating the success or failure of the password reset process. -->

### Handling Email Change

<!-- Implement the `POST /change_email` endpoint to allow users to change their account email address in Supabase. -->
<!-- - Validate the request body to ensure all required fields are provided (e.g., email, newEmail). -->
- Verify the provided email against the registered email in Supabase.
- Update the account's email address with the new email address.
<!-- - Return an appropriate response indicating the success or failure of the email change process. -->

### Code Quality and Best Practices

- Write clean, modular, and well-documented code.
- Follow Dart best practices and coding conventions.
- Use appropriate error handling and logging techniques.

Your task is to implement the API endpoints described above, following the given requirements and best practices. You should use the Shelf framework and the Supabase Dart SDK to interact with the Supabase backend.

Please provide your solution by writing the code for the API endpoints along with any supporting code or explanations necessary to demonstrate your implementation.

## Task
18/5/2023 10:00 AM
