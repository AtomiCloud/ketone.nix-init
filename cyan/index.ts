import { type Cyan, GlobType, StartTemplateWithLambda } from '@atomicloud/cyan-sdk';
import { normalPrompt } from './functions/normal';
import { atomiPrompt } from './functions/atomi';

StartTemplateWithLambda(async (i, d): Promise<Cyan> => {
  const type = await i.select(
    'Which type of Nix do you want to initialize?',
    ['Standard', 'CyanPrint Bun', 'AtomiCloud Suite'],
    'init-type',
    'For default configuration, please choose standard.',
  );

  if (type === 'Standard') {
    return await normalPrompt(i, d);
  }
  if (type === 'CyanPrint Bun') {
    return {
      plugins: [],
      processors: [
        {
          name: 'cyan/default',
          files: [
            {
              root: 'templates/cyanprint-bun',
              glob: '**/*',
              exclude: [],
              type: GlobType.Template,
            },
            {
              glob: '**/*',
              type: GlobType.Copy,
              root: 'templates/common',
              exclude: [],
            },
          ],
          config: {
            vars: {},
            parser: {
              varSyntax: [['var__', '__']],
            },
          },
        },
      ],
    } as Cyan;
  }
  return await atomiPrompt(i, d);
});
