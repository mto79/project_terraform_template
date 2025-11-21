# Digital Ocean Terraform Configuration


## How to Get a DigitalOcean API Key (Personal Access Token)

To get a **DigitalOcean API key (Personal Access Token)**, follow these steps:

### 1. Log in to DigitalOcean
Go to [https://cloud.digitalocean.com/login](https://cloud.digitalocean.com/login) and sign in with your account.

### 2. Go to API settings
- In the top-right corner, click on your avatar → **Manage** → **API**.
- Or open directly: [https://cloud.digitalocean.com/account/api/tokens](https://cloud.digitalocean.com/account/api/tokens).

### 3. Create a new token
- Under the **Tokens/Keys** section, click **Generate New Token**.
- Enter a name for the token (e.g., `cli-access`, `ansible`, or `terraform`).
- Choose permissions:
  - **Read** → if you just need to view data.
  - **Read & Write** → if you need to create, update, or delete resources (most automation tools require this).

### 4. Save your token
- After generating, **copy the token immediately**.
- You won’t be able to see it again later.
- Store it somewhere safe (like a password manager, environment variable, or a config file with restricted permissions).


## Custom Image

Tutorials for getting a custom images with DigitalOcean

[Digitalocean Custom Image Upload](https://docs.digitalocean.com/products/custom-images/how-to/upload/)
[Digitalocean Custom Image limitations](https://docs.digitalocean.com/products/custom-images/details/limits/)
