import type {ReactNode} from 'react';
import clsx from 'clsx';
import Heading from '@theme/Heading';
import styles from './styles.module.css';

type FeatureItem = {
  title: string;
  Svg: React.ComponentType<React.ComponentProps<'svg'>>;
  description: ReactNode;
};

const FeatureList: FeatureItem[] = [
  {
    title: 'Dynamic Theming',
    Svg: require('@site/static/img/undraw_docusaurus_mountain.svg').default,
    description: (
      <>
        Powered by <code>wallust</code>, your system automatically generates 
        a beautiful color palette from your current wallpaper and applies it 
        to all UI components.
      </>
    ),
  },
  {
    title: 'Optimized Performance',
    Svg: require('@site/static/img/undraw_docusaurus_tree.svg').default,
    description: (
      <>
        High-performance custom scripts, like our continuous GPU usage tracker, 
        provide real-time data with effectively zero CPU overhead.
      </>
    ),
  },
  {
    title: 'Minimalist Design',
    Svg: require('@site/static/img/undraw_docusaurus_react.svg').default,
    description: (
      <>
        A clean, focused environment featuring a modern Hyprland setup, 
        a custom special workspace dim effect, and polished OSD components.
      </>
    ),
  },
];

function Feature({title, Svg, description}: FeatureItem) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <Svg className={styles.featureSvg} role="img" />
      </div>
      <div className="text--center padding-horiz--md">
        <Heading as="h3">{title}</Heading>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures(): ReactNode {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
