# Trivial

![Continuous Integration](https://github.com/floriandejonckheere/trivial/workflows/Continuous%20Integration/badge.svg)
![Continuous Deployment](https://github.com/floriandejonckheere/trivial/workflows/Continuous%20Deployment/badge.svg)

![Release](https://img.shields.io/github/v/release/floriandejonckheere/trivial?label=Latest%20release)
![Deployment](https://img.shields.io/github/deployments/floriandejonckheere/trivial/production?label=Deployment)

Trivial is a small web application that mimics Trivial Pursuit's card system. 
Cards are added with questions and answers, and assigned to a category. 
When in presentation modes, the cards within a category are shuffled and shown one by one.

## Structure

The application contains predefined categories, but categories can be added and removed at will. These are system-wide.

The application is divided in *sets* which contain *cards*. Each card has a question, a response and a category.

## Set up

Use the `bin/setup` script or run the following steps manually.

Set up the PostgreSQL database:

```
rails db:setup
```

Initialize database seeds:

```
rails database:seed             # Production and development seeds
rails database:seed:production  # Production seeds
rails database:seed:development # Development seeds
```

## Migrating

Run database migrations:

```
rails db:migrate
```

## Development

Use the `bin/update` script to update your development environment dependencies.

## Testing

Seed the test database before running the test suite:

```
rails database:seed:production RAILS_ENV=test
```

Run the test suite:

```
rspec
```

## Troubleshooting

Github secrets for continuous deployment:

- `DEPLOY_SSH_HOST`
- `DEPLOY_SSH_USER`
- `DEPLOY_SSH_KEY`
- `REGISTRY_TOKEN` (needed for [Github Container Registry](https://docs.github.com/en/packages/getting-started-with-github-container-registry/migrating-to-github-container-registry-for-docker-images))

## Releasing

Update the changelog and bump the version using the `bin/version` tool.
Execute `bin/version --help` to see all parameters.
Create a tag for the version and push it to Github.
A Docker image will automatically be built and pushed to the registry.

```sh
bin/version version 1.0.0
git add lib/trivial/version.rb web/package.json
git commit -m "Bump version to v1.0.0"
git tag v1.0.0
git push origin master
git push origin v1.0.0
```

## Deployment

**Initial deployment**

```sh
# SSH into the server
ssh root@myserver.com

# Create a user
useradd -d /data/apps/trivial -G ssh -G docker -m -s /bin/bash trivial
su - trivial

# Create SSH keypair
myserver$ mkdir ~/.ssh/
ssh-keygen -f ~/.ssh/trivial-deployment-key -b 4096 -C "Trivial deployment key"
cp ~/.ssh/trivial-deployment-key.pub ~/.ssh/authorized_keys

# Initialize the database
docker exec -ti thalarion_postgres_1 psql -U postgres -c "CREATE ROLE trivial WITH ENCRYPTED PASSWORD trivial LOGIN;"
docker exec -ti thalarion_postgres_1 psql -U postgres -c "CREATE DATABASE trivial OWNER trivial;"

# Logout, but don't forget to copy over the private key to your local machine 
logout
logout

# Copy and edit environment file
cp .env.development ops/.env.production.local
edit ops/.env.production.local
scp -i ~/.ssh/trivial-deployment-key.pub ops/.env.production.local /data/apps/trivial/production.env
```

Additionally, set `DEPLOY_SSH_KEY`, `DEPLOY_SSH_HOST` and `DEPLOY_SSH_USER` as Github Actions secrets.

**Subsequent deployments**

Ensure the images have been built and are available in the container registry.
Apply your changes in `ops/docker-compose.yml`.
Update the `production` tag to the correct commit and push it to Github
The file will automatically be deployed, and the containers recreated.

```sh
nano ops/docker-compose.yml
git add ops/docker-compose.yml
git commit -m "Update images to latest version"
git tag -f production
git push origin master && git push -f origin production
```

For initial deployment, copy `.env.production`, `client.key` and `client.pem` manually, and initialize the database.

## License

See [LICENSE.md](LICENSE.md).
