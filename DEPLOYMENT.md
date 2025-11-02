# Deployment Checklist

## Before Deployment

- [ ] Update Strapi dependencies to latest stable version (currently 5.4.2)
- [ ] Test build locally: `npm run build`
- [ ] Ensure all environment variables are documented in `.env.example`
- [ ] Verify database connection string works
- [ ] Check `render.yaml` or `vercel.json` configuration

## Environment Variables Required

### Production Essentials
```
DATABASE_URL=postgresql://user:password@host:port/database
NODE_ENV=production
```

### Security Secrets (generate with `openssl rand -base64 32`)
```
APP_KEYS=
API_TOKEN_SALT=
ADMIN_JWT_SECRET=
TRANSFER_TOKEN_SALT=
JWT_SECRET=
```

### Optional
```
DATABASE_SSL=true
DATABASE_SSL_REJECT_UNAUTHORIZED=false
HOST=0.0.0.0
PORT=1337
```

## Deployment Steps

### Vercel
1. `cd strapi-backend`
2. `vercel login`
3. `vercel` (for preview)
4. Set environment variables in Vercel Dashboard
5. `vercel --prod` (for production)

### Render
1. Push code to GitHub
2. Connect repository to Render
3. Set `DATABASE_URL` in Render Dashboard
4. Deploy automatically via `render.yaml`

## Post-Deployment

- [ ] Access admin panel: `https://your-domain/admin`
- [ ] Create first admin user
- [ ] Test API endpoints: `https://your-domain/api/products`
- [ ] Enable public access in Settings → Users & Permissions → Public
- [ ] Configure CORS in `config/middlewares.js` if needed
- [ ] Update frontend `NEXT_PUBLIC_STRAPI_API_URL` environment variable

## Common Issues

### "strapi: not found"
- Run `npm install` to ensure Strapi is installed
- Check `@strapi/strapi` is in dependencies

### Plugin version mismatch
- All `@strapi/plugin-*` must match `@strapi/strapi` version
- Update all to same version in package.json

### Database connection failed
- Verify `DATABASE_URL` format
- Check database is accessible from deployment platform
- Ensure SSL settings match your database provider

### Build timeout
- Increase build timeout in platform settings
- Optimize dependencies
- Use `npm ci` instead of `npm install`
