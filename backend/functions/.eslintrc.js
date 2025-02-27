module.exports = {
  root: true,
  env: {
    es6: true,
    node: true,
  },
  extends: [
    'eslint:recommended',
    'plugin:import/errors',
    'plugin:import/warnings',
    'plugin:import/typescript',
    'plugin:@typescript-eslint/recommended',
  ],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    project: ['tsconfig.json'],
    sourceType: 'module',
  },
  ignorePatterns: [
    '/node_modules/**/*', // Ignore node modules
    '/lib/**/*', // Ignore built files
    '/sim/**/*', // Ignore simulator files
    '/.nyc_output/**/*', // Ignore Istanbul files
    '.eslintrc.js', // Ignore ESLint file
  ],
  plugins: ['@typescript-eslint', 'import'],
  rules: {
    'space-in-parens': ['error', 'never'],
    'import/no-unresolved': 0,
    'max-len': 'off',
    'require-jsdoc': 'off',
    'no-unused-vars': 'off',
    'no-return-await': 'error',
    '@typescript-eslint/no-unused-vars': [
      'warn',
      {
        argsIgnorePattern: '^_',
        varsIgnorePattern: '^_',
        caughtErrorsIgnorePattern: '^_',
      },
    ],
    '@typescript-eslint/no-floating-promises': 'error',
    '@typescript-eslint/await-thenable': 'error',
  },
};
