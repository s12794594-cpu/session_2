import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Cubit/ArticlesCubit/ArticleCubit.dart';
import 'Cubit/ArticlesCubit/ArticleState.dart';
import 'Cubit/SourcesCubit/SourceCubit.dart';
import 'Cubit/SourcesCubit/SourceState.dart';

class SourceScreen extends StatefulWidget {
   String cat_id ;
  SourceScreen({super.key,required this.cat_id});

  @override
  State<SourceScreen> createState() => _SourceScreenState();
}

class _SourceScreenState extends State<SourceScreen> {
  void initState (){
    super.initState();
    LoadData();
  }
  LoadData(){
    context.read<sourceCubit>().show_data(widget.cat_id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // Sources Tabs
            BlocBuilder<sourceCubit, sourceInitState>(
              builder: (context, state) {
                if (state is sourceLoadingState) {
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
                }

                if (state is sourceErrorState) {
                  return Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  );
                }

                if (state is sourceSuccessState) {
                  final sources =
                      state.sourceModel?.sources ?? [];

                  if (sources.isEmpty) {
                    return const Text(
                      'No sources found',
                      style: TextStyle(color: Colors.white),
                    );
                  }

                  return DefaultTabController(
                    length: sources.length,
                    child: Builder(
                      builder: (tabContext) {
                        return TabBar(
                          isScrollable: true,
                          indicatorColor: Colors.white,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.grey,

                          onTap: (index) {
                            final source = sources[index];

                            final sourceId = source.id;

                            if (sourceId != null &&
                                sourceId.isNotEmpty) {
                              context
                                  .read<articleCubit>()
                                  .show_articles(sourceId);
                            }
                          },

                          tabs: sources.map((source) {
                            return Tab(
                              child: Text(
                                source.name ?? '',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),

            // Articles
            Expanded(
              child: BlocBuilder<articleCubit, articleInitState>(
                builder: (context, state) {
                  if (state is articleLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    );
                  }

                  if (state is articleErrorState) {
                    return Center(
                      child: Text(
                        'Error loading articles',
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    );
                  }

                  if (state is articleSuccessState) {
                    final articles =
                        state.articleModel?.articles ?? [];

                    if (articles.isEmpty) {
                      return const Center(
                        child: Text(
                          'No articles found',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      );
                    }

                    return ListView.separated(
                      padding: const EdgeInsets.all(12),
                      itemCount: articles.length,

                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 12);
                      },

                      itemBuilder: (context, index) {
                        final article = articles[index];

                        return Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                            BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),

                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.center,
                            children: [
                              // Article Image
                              if (article.urlToImage != null &&
                                  article.urlToImage!
                                      .trim()
                                      .isNotEmpty)
                                Image.network(
                                  article.urlToImage!,
                                  width:
                                  MediaQuery.of(context)
                                      .size
                                      .width *
                                      0.9,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, error, stackTrace) {
                                    return const SizedBox(
                                      height: 180,
                                      child: Center(
                                        child: Icon(
                                          Icons.broken_image,
                                          color: Colors.white,
                                          size: 50,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              else
                                const SizedBox(
                                  height: 180,
                                  child: Center(
                                    child: Icon(
                                      Icons.image_not_supported,
                                      color: Colors.white,
                                      size: 50,
                                    ),
                                  ),
                                ),

                              const SizedBox(height: 10),

                              // Article Title
                              Text(
                                article.title ?? '',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),

                              const SizedBox(height: 10),

                              // Author and Date
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'By ${article.author ?? "Unknown"}',
                                      maxLines: 2,
                                      overflow:
                                      TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 8),

                                  Flexible(
                                    child: Text(
                                      article.publishedAt ?? '',
                                      textAlign: TextAlign.end,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }

                  return const Center(
                    child: Text(
                      'Choose a source to see articles',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}