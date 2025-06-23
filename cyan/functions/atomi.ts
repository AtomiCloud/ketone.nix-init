import { type Cyan, type CyanGlob, GlobType, type IDeterminism, type IInquirer } from '@atomicloud/cyan-sdk';

function SimpleCopy(vars: Record<string, string | boolean>, ...files: CyanGlob[]): Cyan {
  return {
    plugins: [],
    processors: [
      {
        name: 'cyan/default',
        files,
        config: {
          vars,
          parser: {
            varSyntax: [
              ['var__', '__'],
              ['<%', '%>'],
            ],
          },
        },
      },
    ],
  } as Cyan;
}

export async function atomiPrompt(i: IInquirer, d: IDeterminism): Promise<Cyan> {
  const runtime = await i.select('Runtime', ['Go', '.NET', 'Bun'], 'runtime', 'Runtime to setup with Nix');

  const p = await i.text('Platform', 'platform', 'LPSM Service Tree Platform');
  const s = await i.text('Service', 'service', 'LPSM Service Tree Service');

  const platform = p.charAt(0).toUpperCase() + p.slice(1).toLowerCase();
  const service = s.charAt(0).toUpperCase() + s.slice(1).toLowerCase();

  const infra = await i.confirm(
    'Infrastructure (y/n)',
    'infra',
    'Include infrastructure binaries like helm, k3d, kubectl and docker',
  );
  const vars: Record<string, string | boolean> = { platform, service, infra };

  if (runtime === 'Go') {
    return SimpleCopy(vars, {
      root: 'templates/go',
      exclude: [],
      glob: '**/*',
      type: GlobType.Template,
    });
  }
  if (runtime === '.NET') {
    return SimpleCopy(vars, {
      root: 'templates/dotnet',
      exclude: [],
      glob: '**/*',
      type: GlobType.Template,
    });
  }

  return SimpleCopy(vars, {
    root: 'templates/bun',
    exclude: [],
    glob: '**/*',
    type: GlobType.Template,
  });
}
