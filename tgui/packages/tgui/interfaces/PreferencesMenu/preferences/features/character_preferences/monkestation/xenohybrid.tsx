import {
  Feature,
  FeatureChoiced,
  FeatureColorInput,
  FeatureDropdownInput,
} from '../../base';

export const xeno_color: Feature<string> = {
  name: 'Xeno Color',
  small_supplemental: true,
  description:
    "The color of your character's xenos.",
  component: FeatureColorInput,
};

export const xeno_color_secondary: Feature<string> = {
  name: 'Xeno Color Secondary',
  small_supplemental: true,
  description:
    "The color of your character's xenos.",
  component: FeatureColorInput,
};

export const xeno_color_tri: Feature<string> = {
  name: 'Xeno Color Tri',
  small_supplemental: true,
  description:
    "The color of your character's xenos.",
  component: FeatureColorInput,
};

export const feature_xeno_tail: FeatureChoiced = {
  name: 'Tail',
  small_supplemental: false,
  component: FeatureDropdownInput,
};

export const feature_xeno_head: FeatureChoiced = {
  name: 'XenoHead',
  small_supplemental: false,
  component: FeatureDropdownInput,
};

export const feature_xeno_xenodorsal: FeatureChoiced = {
  name: 'Xenodorsal',
  small_supplemental: false,
  component: FeatureDropdownInput,
};
