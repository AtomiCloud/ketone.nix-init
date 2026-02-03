import { type Cyan, GlobType, type IDeterminism, type IInquirer } from '@atomicloud/cyan-sdk';

export async function normalPrompt(i: IInquirer, d: IDeterminism): Promise<Cyan> {
  const vars: Record<string, string> = { description: '' };

  vars.description = await i.text('Description', 'Description of this Project');

  const standard = await i.confirm('Include default binaries (y/n)', 'standard-binary');
  const pc = await i.confirm('Include Pre-Commit Hooks (y/n)', 'pre-commit');

  const folder = standard ? 'templates/normal/standard' : 'templates/normal/empty';
  const folderExclude = pc ? [] : ['**/pre-commit.nix', '**/fmt.nix'];
  const precommit = pc ? 'templates/normal/with-pc' : 'templates/normal/without-pc';

  return {
    processors: [
      {
        name: 'cyan/default',
        files: [
          {
            glob: '**/*',
            type: GlobType.Copy,
            root: 'templates/common',
            exclude: [],
          },
          {
            glob: '**/*',
            type: GlobType.Template,
            root: 'templates/normal/common',
            exclude: [],
          },
          {
            glob: '**/*',
            type: GlobType.Template,
            root: folder,
            exclude: folderExclude,
          },
          {
            glob: '**/*',
            type: GlobType.Template,
            root: precommit,
            exclude: [],
          },
        ],
        config: {
          vars,
          parser: {
            varSyntax: [['var__', '__']],
          },
        },
      },
    ],
    plugins: [],
  } as Cyan;
}
