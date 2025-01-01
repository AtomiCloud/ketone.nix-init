import { Cyan, CyanGlob, GlobType, IDeterminism, IInquirer } from '@atomicloud/cyan-sdk';

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
  const runtime = await i.select('Runtime', ['Go', '.NET', 'Bun'], 'Runtime to setup with Nix');

  const platform = await i.text('Platform', 'LPSM Service Tree Platform');
  const service = await i.text('Service', 'LPSM Service Tree Service');

  const infra = await i.confirm('Infrastructure', 'Include infrastructure binaries like helm, k3d, kubectl and docker');
  const vars: Record<string, string | boolean> = { platform, service, infra };

  if (runtime == 'Go') {
    return SimpleCopy(vars, {
      root: 'templates/go',
      exclude: [],
      glob: '**/*',
      type: GlobType.Template,
    });
  } else if (runtime == '.NET') {
    return SimpleCopy(vars, {
      root: 'templates/dotnet',
      exclude: [],
      glob: '**/*',
      type: GlobType.Template,
    });
  } else {
    return SimpleCopy(vars, {
      root: 'templates/bun',
      exclude: [],
      glob: '**/*',
      type: GlobType.Template,
    });
  }
}
