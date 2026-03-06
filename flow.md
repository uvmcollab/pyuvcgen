# Flow

1. Update version in `pyproject.toml`
2. Run `uv lock`
3. Delete the old `dist` directory

```bash
rm -rf dist/
```

4. Build the project

```bash
uv build
```

5. Publish with
 
```bash
uv publish --index testpypi --token XXXX
```
5. To test locally use

```bash
uv pip install --index-url https://pypi.org/simple  --extra-index-url https://test.pypi.org/simple --index-strategy unsafe-best-match pyuvcgen
```

7. Once everything is tested publish in PyPi

```bash
uv publish --token XXXX
```

> **IMPORTANT:** Keep your TOKEN save
